import requests

headers = {
    'Authorization': 'Basic dXJnZW1jc3BsdXJnZTpkZDIxNDc0YS1lM2QyLTQwYTAtYWFiYi04YjM5NjlhNzI4YjA',
    'Content-Type': 'application/json',
}

data = {
	"urls": [
			{
			"long_url": "https://www.apple.com"
			}
	]
}

result = requests.patch("https://tiny.cc/tiny/api/3/urls/thisisanothertest", headers=headers, data=data)
print(result.text)
