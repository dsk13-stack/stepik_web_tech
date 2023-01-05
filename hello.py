def wsgi_app(environ=dict, start_response=callable) -> str:
    response = "\n".join(environ["QUERY_STRING"].strip().split("&"))
    status = "200 OK"
    response_headers = [("Content-type", "text/plain"), ("Content-length", str(len(response)))]
    start_response(status, response_headers)
    return response
