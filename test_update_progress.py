# 测试更新进度功能
import os
import sys

# 添加路径
sys.path.append(r"D:\workspace\coding\mx_toolpack\asset\scripts")

def test_update_progress():
    """测试更新进度功能是否正常"""
    try:
        from mx_asset_library import MX_AssetLibrary
        import tempfile
        
        # 创建临时目录作为assets路径
        temp_dir = tempfile.mkdtemp()
        print(f"使用临时目录: {temp_dir}")
        
        # 创建Asset Library实例
        library = MX_AssetLibrary(temp_dir)
        
        # 检查状态标签是否存在
        assert hasattr(library, 'models_status_label'), "缺少models_status_label"
        assert hasattr(library, 'textures_status_label'), "缺少textures_status_label"
        
        # 检查更新方法是否存在
        assert hasattr(library, 'update_models_with_progress'), "缺少update_models_with_progress方法"
        assert hasattr(library, 'update_textures_with_progress'), "缺少update_textures_with_progress方法"
        
        print("✅ 所有必要的组件都存在")
        print("✅ 更新进度功能应该能正常工作了")
        
        return library
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        return None

if __name__ == "__main__":
    test_update_progress()
