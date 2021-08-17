from imgurpython import ImgurClient

client_id = 'c285b944ea398a9'
client_secret = '5fe818f5b57339e25159ebb45d50b3a91f3462be'

client = ImgurClient(client_id, client_secret)

# Example request
items = client.gallery()
for item in items:
    print(item.link)
