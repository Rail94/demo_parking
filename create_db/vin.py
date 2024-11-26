import requests

url = "https://vin-decoder-api-europe.p.rapidapi.com/vin"

querystring = {"vin":"WVWZZZAAZJD161753"}

headers = {
	"x-rapidapi-key": "425c9b8ec5msh136db1f7d1c3fb0p1d0809jsnec37aa970181",
	"x-rapidapi-host": "vin-decoder-api-europe.p.rapidapi.com"
}

response = requests.get(url, headers=headers, params=querystring)

print(response.json())