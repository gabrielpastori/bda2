import pymysql
import getpass, glob, re
import geopandas as gpd 

def insert_cities(cities,cur):
    for index, row in cities.iterrows():
        data = (row['name'],row['geometry'],row['state_initial'])
        cur.execute('INSERT INTO city (name, geometry, fk_city_state) VALUES (%s, ST_GeomFromText(%s), %s)', data)


def main():
    states_files = glob.glob("geojson/states/*")

    password = getpass.getpass()

    database = 'geodata'
    user = 'root'
    host='localhost'
    
    con = pymysql.connect(host=host, user=user, passwd=password, database=database)
    cur = con.cursor()
    con.autocommit(True)

    for state_file in states_files:
        state = re.findall("[ \w-]+?(?=\.)",state_file)[0]
        cities = gpd.read_file(state_file)
        cities['state_initial'] = state
        
        insert_cities(cities,cur)
    

main()
