def wsgi_app(environ, start_response):
    response = "\r\n".join(environ["QUERY_STRING"].split("&"))
    status = "200 OK"
    response_headers = [("Content-type", "text/plain"), ("Content-length", str(len(response)))]
    start_response(status, response_headers)
    return [bytes(response, encoding="UTF-8")]

if __name__ == "__main__":
    print("wcgi app")