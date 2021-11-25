import geopandas as gpd
import pymysql
import getpass

def main():
    data_points = gpd.read_file("geojson/qualidade_agua.geojson")
    password = getpass.getpass()

    database = 'geodata'
    user = 'root'
    host='localhost'
    
    con = pymysql.connect(host=host, user=user, passwd=password, database=database)
    cur = con.cursor()
    con.autocommit(True)

    for index, row in data_points.iterrows():
        data = (row['codigo'], row['responsavel'], row['corpo_hidrico'], row['ano'], row['cont'], row['media'], row['min'], row['max'], row['stddev'], row['variance'], row['geometry'], row['uf'])
        sql = '''INSERT INTO point (code, responsible, water_body, year, count, mean, min, max, stddev, variance, geometry, state_initial) 
                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,  ST_GeomFromText(%s), %s)'''
        cur.execute('INSERT INTO point (code, responsible, water_body, year, count, mean, min, max, stddev, variance, geometry, state_initial) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,  ST_GeomFromText(%s), %s)', data)



main()