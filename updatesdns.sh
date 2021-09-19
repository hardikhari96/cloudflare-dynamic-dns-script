#IPVERSION_SIX=$(curl GET "https://v6.ipv6-test.com/api/myip.php");
IPVERSION_SIX=$(curl GET "https://api64.ipify.org/?format=text");
UPDATE_RES=$(curl -X PUT "https://api.cloudflare.com/client/v4/zones/"$cloudflare_zone"/dns_records/"$cloudflare_record_id \
     -H "X-Auth-Email: "$cloudflare_email \
     -H "X-Auth-Key: "$cloudflare_auth_key \
     -H "Content-Type: application/json" \
     --data '{"type":"AAAA","name":"home","content":"'$IPVERSION_SIX'","proxied":false}')

echo $UPDATE_RES;
echo $UPDATE_RES | \
     python3 -c 'import json,sys; print(json.dumps(json.load(sys.stdin)["result"],sort_keys=True, indent=4))';
echo your ipv6 : $IPVERSION_SIX
