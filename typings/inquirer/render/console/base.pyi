"""
This type stub file was generated by pyright.
"""

MAX_OPTIONS_DISPLAYED_AT_ONCE = ...
half_options = ...
class BaseConsoleRender:
    title_inline = ...
    def __init__(self, question, theme=..., terminal=..., show_default=..., *args, **kwargs) -> None:
        ...
    
    def get_header(self):
        ...
    
    def get_current_value(self): # -> Literal['']:
        ...
    
    def get_options(self): # -> list[Unknown]:
        ...
    
    def process_input(self, pressed):
        ...
    
    def handle_validation_error(self, error): # -> str:
        ...
    

