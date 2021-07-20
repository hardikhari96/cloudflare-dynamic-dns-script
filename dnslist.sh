curl -X GET "https://api.cloudflare.com/client/v4/zones/"$cloudflare_zone"/dns_records" \
     -H "X-Auth-Email: "$cloudflare_email \
     -H "X-Auth-Key: "$cloudflare_auth_key \
     -H "Content-Type: application/json" | python3 -c 'import json,sys; print(json.dumps(json.load(sys.stdin)["result"],sort_keys=True, indent=4))';
