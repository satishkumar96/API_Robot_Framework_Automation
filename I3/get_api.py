import json
import requests


def get_token():
    url = "https://alpha4-api.payschools.com/v2/public/Authentication"

    headers = {"Content-Type": "application/json", "Authorization": "Token NewAdminKey1"}

    data = {
        "UserName": "ChimeraQA",
        "Password": "QA2022Testing",
        "URL": "https://alpha4a-test.sdms2.com/"
    }

    response = requests.post(url=url, data=json.dumps(data), headers=headers)
    return "Token " + response.json()['APIKey']
