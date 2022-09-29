from operator import contains
import requests
from bs4 import BeautifulSoup
import re

car_year = 2008
car_make = "Ford"
car_model = "Focus"
car_submodel = "S"


def get_part_list_link(part_name,soup):
    """Normalizes part name, then finds the href url for that part section

    Args:
        part_name (string): The name of the part you want to search for
        soup (bs4.BeautifulSoup): The Soup for the car parts main page

    Returns:
        string: the url to the car part requested
    """
    normalized_part_name = part_name.lower()
    normalized_part_name = normalized_part_name.replace(" ","-")
    try:
        part_list_link = soup.find(href=re.compile(normalized_part_name))
        return part_list_link.get('href')
    except AttributeError:
        print("No such part found")

def compose_url(car_year,car_make,car_model,car_submodel):
    """Combines all the car part info into a string the requests can send

    Args:
        car_year (int): Year of the car
        car_make (str): Make of the car
        car_model (str): Model of the car
        car_submodel (str): Submodel of the car

    Returns:
        str: A constructed url using the given data
    """
    base = "http://carparts.com/vehicle/"
    base = base + str(car_year) + "/" + car_make + "/" + car_model + "/" + car_submodel
    return base

def get_part_page_soup(link):
    """Given the part of the url that has to be appended to the main page, this returns the soup for the part list.

    Args:
        link (_type_): _description_

    Returns:
        _type_: _description_
    """
    formatted_link = "http://carparts.com" + link
    try:
        r = requests.get(formatted_link, timeout=5,headers={
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'en-US,en;q=0.9',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0',
    'Accept': 'application/json, text/plain, */*',
    'Sec-Fetch-Site': 'same-site'
    })
    except requests.exceptions.Timeout:
        print("Timeout occurred")
    return BeautifulSoup(r.content, 'html.parser')

try:
    r = requests.get(compose_url(str(car_year),car_make,car_model,car_submodel), timeout=5,headers={
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'en-US,en;q=0.9',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0',
    'Accept': 'application/json, text/plain, */*',
    'Sec-Fetch-Site': 'same-site'
    })
except requests.exceptions.Timeout:
    print("Timeout occurred")

main_page = BeautifulSoup(r.content, 'html.parser')
part_page = get_part_page_soup(get_part_list_link("catalytic",main_page))
print(part_page.title)
