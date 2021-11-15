import requests
pagina = requests.get("https://www.uanl.mx/eventos/")
print("El estatus de la pagina web es: ")
print (pagina.status_code)
