"""
This type stub file was generated by pyright.
"""

from inquirer.render.console.base import BaseConsoleRender

class Editor(BaseConsoleRender):
    title_inline = ...
    def __init__(self, *args, **kwargs) -> None:
        ...
    
    def get_current_value(self): # -> str:
        ...
    
    def handle_validation_error(self, error): # -> str:
        ...
    
    def process_input(self, pressed):
        ...
    


