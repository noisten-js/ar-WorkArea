import requests
from bs4 import BeautifulSoup


def get_tallgrass_segment_data():
    base_url = 'https://pipeline.tallgrassenergylp.com'
    url = f'{base_url}/Pages/Segment.aspx?pipeline=501&type=OA'
    base_payload = {
        "pipeline": "501",
        "type": "OA"
    }

    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36",
        "Accept-Language": "en-US,en;q=0.9",
        "Accept-Encoding": "gzip, deflate, br, zstd",
        "Connection": "keep-alive",
        "Cache-Control": "max-age=0",
        "Referer": url,
        "Sec-Ch-Ua": '"Microsoft Edge";v=129", "Not=A?Brand";v="8","Chromium";v="129"',
        "Sec-Ch_Ua": "?0",
        "Sec-Ch-Ua-Platform": "Windows",
        "Sec-Fetch-Dest": "document",
        "Sec-Fetch-Mode": "navigate",
        "Sec-Fetch_Site": "same-origin",
        "Sec-Fetch_User": "?1",
        "Upgrade-Insecure-Requests": "1",
    }

    session = requests.Session()
    return session.get(url, headers=headers)

    # retrieve_payload = {
    #     "ctl00$scp_default": "ctl00$updContent|ctl00$mainContent$btnRetrieve",
    #     "ctl00$mainContent$tbGasFlow": "9/16/2024",
    #     "ctl00$mainContent$tbgasflowend": "9/17/2024",
    #     "ctl00$mainContent$ddlCycle": 6,
    #     "ctl00$mainContent$direction": "rbEastbound"
    # }
    #
    # session = requests.Session()
    # response = session.post(url, data=base_payload)
    # return response
    #
    # soup = BeautifulSoup(response.content, 'html.parser')
    #
    # try:
    #     viewstate = soup.find('input', {'name': '__VIEWSTATE'})['value']
    #     eventvalidation = soup.find('input', {'name': '__EVENTVALIDATION'})['value']
    #     return viewstate, eventvalidation, soup
    #
    # except Exception:
    #     pass
    #
    # return None, None, soup, response
