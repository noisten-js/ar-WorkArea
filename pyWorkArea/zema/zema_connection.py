import requests


base_url = "https://anteroresources-uat.zemacloud.com/datadirect/api/v1"


def connect_api(
    login_url: str = f"{base_url}/login",
    username: str = None,
    password: str = None,
    client: str = 'Antero Resources'
):
    session = requests.Session()
    payload = f'username={username}&password={password}&client={client}'
    headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }

    response = session.post(login_url, headers=headers, data=payload)
    api_key = response.json()['data']['ZE-REST-Session']
    headers = {
        'ZE-REST-Session': api_key,
        'Cookie': f'JSESSIONID={response.cookies['JSESSIONID']}'
    }

    return session, headers


def zema_query_example():
    x = connect_api(username='zema', password='Antero54321!')

    url = (
        f'{base_url}/curve/data?'
        'dataType=Time Series'
        '&startDate=2024-09-24'
        '&endDate=2024-09-25'
        '&includeProperties=ALL'
        '&filter={properties:[{name:"Curve Type",values:["Settle"]}]}'
    )
    response = x[0].get(url, headers=x[1])
    j = response.json()

    return x, j


def split_file_by_lines(fp: str, split_fp: str, line_count: int, last_line_first: bool = True):
    with open(fp, mode='r') as f:
        idx = 1
        data = [ln for ln in f.readlines()]

    if last_line_first:
        data = data[::-1]

    with open(split_fp, mode='w') as f:
        f.writelines(data[0:line_count])

    return data
