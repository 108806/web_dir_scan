import requests
import sys
import time


start_time = time.time()


wordlist = open("_DICT.txt", encoding='utf8')
words = [w.strip('\n') for w in wordlist.readlines()]
target_url = 'https://google.pl/'
target_url_ESC = f"{target_url.split('//')[1].strip('/').replace('.', '_')}.txt"

print(f'WORDS : {len(words)}')


def circles():
  with open(f"_RESULTS_{target_url_ESC}", 'a+', encoding='utf8') as results:
    results.writelines(f'\n\n\nRunning @ {target_url}\n')

    for w in words:

      req = requests.head(f'{target_url+w}')
      code = req.status_code
      s_code = str(code)

      if code != 404: 
        results.writelines(req.url+' '+s_code+'\n')
        print(req.url)
        
      print(w + ":"+s_code)

      #debug ;
      #print(req.headers,req.content, sep='\n')
    

  results.close()
circles()


print("--- %s seconds ---" % (time.time() - start_time))