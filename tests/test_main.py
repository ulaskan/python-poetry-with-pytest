import pytest
from src.name import formatted_name

def test_formatted_name():
   result = formatted_name("john", "smith")
   assert result, "John Smith"
