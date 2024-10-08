## About MJCG compounds
MJCG compounds is an open-source Bifrost compound library developed by Maxime Jeanmougin. It is aimed at extending the production possibilities of Bifrost and to provide learning graphs for new Bifrost users.

## License
MJCG compounds is released under MIT license. Please include the license notice if you redistribute copies or portions of a compound. Check LICENSE.md for more information.

## Dependencies
MJCG compounds 2.0.0 requires Bifrost 2.2.1.0 or higher. Some sample graphs also require Rebel-pack 0.4.1 or higher.

## Installation
Set or append a `BIFROST_LIB_CONFIG_FILES` environment variable with a path pointing to `bifrost_lib_config.json`. Make sure to include the config file name and extension with the path. 
For Maya users, this can also be set it inside the `maya.env` file like this: `BIFROST_LIB_CONFIG_FILES= C:/.../MJCG_compounds/bifrost_lib_config.json`

## Update script
An update script from can be used to automatically update your compounds, graphs and .ma Maya files making use of older versions of MJCG compounds. This action is not undoable, so make sure to backup your files in case a problem occurs during the process.  

Notice on how to use from Autodesk: On Windows this script can be used with drag-and-drop – simply drag and drop .json files, Maya ascii files (.ma), or whole directories containing such and it’ll update them. It can also be used from the command line: `python MJCG_update_script_2_0_0.py path/to/files/or/folders/`

## Documentation
Compounds have embeded documentation which you can read in the `Info` tab of the Bifrost's `Parameter Editor`. Graphs are laid out with commented backdrops which roughly explains the process of each operations. 

## Support the development
You can support the development of MJCG compounds through the following platforms.

Support on Gumroad: https://gumroad.com/mjcg  

Support on Patreon: https://www.patreon.com/mjcg

## Contact
Follow me on Twitter: https://twitter.com/Mjcg91  

Join the Bifrost Addicts community on Slack: https://join.slack.com/t/bifrostaddicts/shared_invite/zt-m6jg2ee9-jCHNbWodBNMDe5YaWUD7jQ