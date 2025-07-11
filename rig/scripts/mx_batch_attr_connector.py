# -*- coding: utf-8 -*-
"""
Maya Batch Attribute Connector
==============================
UI with two rows:
     **Top row** — Driver object and attributes
     **Bottom row** — Driven object(s) and driven attributes
Left column shows object list; right column shows attributes

Press **Connect** to connect selected driver attribute to all selected driven attributes.
Supports one-to-many attribute connections.

Compatible with both Python 2 (PySide) and Python 3 (PySide2) in modern Maya
versions (2017 - 2025).
"""
from __future__ import absolute_import, division, print_function, unicode_literals

from maya import cmds, OpenMayaUI

# -----------------------------------------------------------------------------
# Qt compatibility wrappers
# -----------------------------------------------------------------------------
import sys
try:
    from PySide2 import QtCore, QtWidgets, QtGui
    from shiboken2 import wrapInstance
except ImportError:
    from PySide import QtCore, QtGui
    from shiboken import wrapInstance
    QtWidgets = QtGui

def get_maya_main_window():
    main_window_ptr = OpenMayaUI.MQtUtil.mainWindow()
    if main_window_ptr is not None:
        if sys.version_info[0] >= 3:
            return wrapInstance(int(main_window_ptr), QtWidgets.QWidget)
        else:
            return wrapInstance(long(main_window_ptr), QtWidgets.QWidget)
    return None

class MX_AttrBatchConnector(QtWidgets.QDialog):
    WINDOW_OBJECT_NAME = "AttrBatchConnectorWindow"
    WINDOW_TITLE = "Batch Attribute Connector"

    @classmethod
    def show_window(cls):
        if cmds.window(cls.WINDOW_OBJECT_NAME, exists=True):
            cmds.deleteUI(cls.WINDOW_OBJECT_NAME)

        win = cls()
        win.setObjectName(cls.WINDOW_OBJECT_NAME)
        win.show()

    def __init__(self, parent=get_maya_main_window()):
        super(MX_AttrBatchConnector, self).__init__(parent)
        self.setWindowTitle(self.WINDOW_TITLE)
        self.setObjectName(self.WINDOW_OBJECT_NAME)
        self.setMinimumSize(600, 400)
        self.setWindowFlags(QtCore.Qt.Window)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)

        self._build_ui()
        self._make_connections()

    def _build_ui(self):
        main_vlay = QtWidgets.QVBoxLayout(self)

        # Driver group (top)
        driver_grp = QtWidgets.QGroupBox("Driver")
        driver_lay = QtWidgets.QHBoxLayout(driver_grp)

        self.src_list = QtWidgets.QListWidget()
        self.src_list.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        driver_lay.addWidget(self.src_list, 1)

        self.src_attr_list = QtWidgets.QListWidget()
        self.src_attr_list.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
        driver_lay.addWidget(self.src_attr_list, 1)

        main_vlay.addWidget(driver_grp)

        # Driven group (bottom)
        driven_grp = QtWidgets.QGroupBox("Driven")
        driven_lay = QtWidgets.QHBoxLayout(driven_grp)

        self.dst_list = QtWidgets.QListWidget()
        self.dst_list.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
        driven_lay.addWidget(self.dst_list, 1)

        self.dst_attr_list = QtWidgets.QListWidget()
        self.dst_attr_list.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
        driven_lay.addWidget(self.dst_attr_list, 1)

        main_vlay.addWidget(driven_grp)

        # Button row
        btn_lay = QtWidgets.QHBoxLayout()
        main_vlay.addLayout(btn_lay)

        self.btn_load_src = QtWidgets.QPushButton("Load Driver")
        self.btn_load_dst = QtWidgets.QPushButton("Load Driven")
        self.btn_connect = QtWidgets.QPushButton("connect")
        self.btn_close = QtWidgets.QPushButton("Close")

        btn_lay.addWidget(self.btn_connect)
        btn_lay.addStretch(1)
        btn_lay.addWidget(self.btn_load_src)
        btn_lay.addWidget(self.btn_load_dst)
        btn_lay.addWidget(self.btn_close)

        self.btn_close.clicked.connect(self.close)

    def _make_connections(self):
        self.btn_load_src.clicked.connect(lambda: self._populate_obj_list(self.src_list, single=True))
        self.btn_load_dst.clicked.connect(lambda: self._populate_obj_list(self.dst_list, single=False))
        self.btn_connect.clicked.connect(self._do_connect)

        self.src_list.currentTextChanged.connect(self._refresh_src_attrs)
        self.dst_list.itemSelectionChanged.connect(self._refresh_dst_attrs)

    def _populate_obj_list(self, list_widget, single=False):
        sel = cmds.ls(selection=True, long=True) or []
        list_widget.clear()
        if single and sel:
            QtWidgets.QListWidgetItem(sel[0], list_widget)
        else:
            for node in sel:
                QtWidgets.QListWidgetItem(node, list_widget)

    def _refresh_src_attrs(self, node):
        self._populate_attr_list(node, self.src_attr_list, is_driver=True)

    def _refresh_dst_attrs(self):
        selected_items = self.dst_list.selectedItems()
        if selected_items:
            node = selected_items[0].text()
            self._populate_attr_list(node, self.dst_attr_list, is_driver=False)

    def _populate_attr_list(self, node, list_widget, is_driver=False):
        list_widget.blockSignals(True)
        list_widget.clear()
        if not node or not cmds.objExists(node):
            list_widget.blockSignals(False)
            return

        attrs = []
        
        if is_driver:
            # 对于driver，优先列出output属性和可连接属性
            output_attrs = cmds.listAttr(node, output=True) or []
            connectable_attrs = cmds.listAttr(node, connectable=True) or []
            keyable_attrs = cmds.listAttr(node, keyable=True) or []
            user_attrs = cmds.listAttr(node, userDefined=True) or []
            
            # 合并所有属性，去重并排序
            attrs = sorted(set(output_attrs + connectable_attrs + keyable_attrs + user_attrs))
        else:
            # 对于driven，只列出基本的可输入属性
            keyable_attrs = cmds.listAttr(node, keyable=True) or []
            user_attrs = cmds.listAttr(node, userDefined=True) or []
            
            # 合并所有属性，去重并排序
            attrs = sorted(set(keyable_attrs + user_attrs))

        for attr in attrs:
            QtWidgets.QListWidgetItem(attr, list_widget)
        list_widget.blockSignals(False)

    def _do_connect(self):
        src_node = self.src_list.currentItem().text() if self.src_list.currentItem() else None
        dst_items = self.dst_list.selectedItems()
        dst_nodes = [i.text() for i in dst_items]

        if not src_node or not dst_nodes:
            cmds.warning("Driver or driven objects not selected.")
            return

        src_attrs = [self.src_attr_list.item(i).text() for i in range(self.src_attr_list.count())
                     if self.src_attr_list.item(i).isSelected()]
        dst_attrs = [self.dst_attr_list.item(i).text() for i in range(self.dst_attr_list.count())
                     if self.dst_attr_list.item(i).isSelected()]

        if not src_attrs or not dst_attrs:
            cmds.warning("Please select both driver and driven attributes.")
            return

        if len(src_attrs) != 1:
            cmds.warning("Only one driver attribute should be selected for one-to-many mode.")
            return

        src_attr = src_attrs[0]

        for dst_node in dst_nodes:
            for dst_attr in dst_attrs:
                src_plug = "{0}.{1}".format(src_node, src_attr)
                dst_plug = "{0}.{1}".format(dst_node, dst_attr)
                if not cmds.objExists(src_plug) or not cmds.objExists(dst_plug):
                    continue
                try:
                    cmds.connectAttr(src_plug, dst_plug, force=True)
                except RuntimeError as exc:
                    cmds.warning("Failed to connect {0} -> {1}: {2}".format(src_plug, dst_plug, exc))
        cmds.informDialog(title="Batch Connect", message="Connections complete.")

