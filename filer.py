import requests
import sys
import json
import pickle

token = "DP1Tgi90uvX6BzTwwLaThoqmk2KpZzFMAEMU9GTfpEHF1ptsBcmyBHtqsymD"

file_name = sys.argv[1]
files = {}
with open("files", "rb") as fp:   # Unpickling
	files = pickle.load(fp)

url = requests.post("http://ix.io", files={'f:1': open('push', 'rb')})

if file_name in files:
	# print("Updating " + file_name)
	# params = {
 #    "long_url": "https://yahoo.com/"
	# }
	# response = requests.patch("https://api-ssl.bitly.com/v4/bitlinks/"+files[file_name], json=params, headers={'Authorization': 'Bearer e4225aec8e5a3adf9df2f23b2a26b4a57ea84f38'})
	# print(response)
	print(requests.get("https://api-ssl.bitly.com/v4/groups/Bm1pljvUkM1/bitlinks", headers={'Authorization': 'Bearer e4225aec8e5a3adf9df2f23b2a26b4a57ea84f38'}).text)
else:
	print("Creating link for " + file_name)
	params = {
    "long_url": "https://google.com/"
	}
	response = requests.post("https://api-ssl.bitly.com/v4/shorten", json=params, headers={'Authorization': 'Bearer e4225aec8e5a3adf9df2f23b2a26b4a57ea84f38'})
	data = json.loads(response.text)
	files[file_name] = data["link"]
	print(data)
	with open("files", "wb") as fp:
		pickle.dump(files, fp)






