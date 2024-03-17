import json
import sys
import os
from http.server import BaseHTTPRequestHandler, HTTPServer
from slack_sdk import WebClient

class Server(BaseHTTPRequestHandler):
    def _set_response(self):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()

    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        data = json.loads(post_data.decode('utf-8'))

        # Verifica se o evento é um Warning ou Error
        if 'Warning' in data['message'] or 'Error' in data['message']:
            print("Evento Importante: ", data)
            self.send_to_slack(data)

        self._set_response()

    def send_to_slack(self, data):
        message = f"Evento Importante: {data['message']}"
        client = WebClient(token=os.environ["xoxb-6776156708533-6811437788000-NVXWG0mIGbKL2NTjv72tAlWe"])
        client.chat_postMessage(
            channel="alinhamento",
            text=message,
            username="kubewatch"
        )

def run(server_class=HTTPServer, handler_class=Server, port=8080):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting httpd on port {port}...')
    httpd.serve_forever()

if __name__ == "__main__":
    from sys import argv

    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()
