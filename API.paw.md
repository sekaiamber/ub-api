# GET /rucaptcha

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSJ9.aw62HjxpebDz9mIszd1zZ6nWuifeC0F0wVKOZSHIozc
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# POST /api/v1/sessions.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSJ9.aw62HjxpebDz9mIszd1zZ6nWuifeC0F0wVKOZSHIozc
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "login": "8618537100239",
                "password": "123123"
            }



# DELETE /api/v1/sessions.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# POST /api/v1/users.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSJ9.aw62HjxpebDz9mIszd1zZ6nWuifeC0F0wVKOZSHIozc
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "phone_number": "185371002397",
                "password": "123456",
                "password_confirmation": "123456",
                "invite_code": "2TSKDK",
                "nickname": "7",
                "verify_code": "crpsa"
            }

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Frame-Options: SAMEORIGIN
            X-Runtime: 0.072894
            X-XSS-Protection: 1; mode=block
            Transfer-Encoding: chunked
            CF-Cache-Status: DYNAMIC
            Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
            Cache-Control: max-age=0, private, must-revalidate
            X-Request-Id: 20a98eea-1ea9-4a34-bb6d-991a38b3e1f7
            CF-RAY: 57268384fa4daa6c-SIN
            X-Content-Type-Options: nosniff
            Etag: W/"8c3b69b98e054bd75339154152194635"
            Vary: Accept-Encoding

    + Body

            {"success":false,"errors":[{"code":"000401","message":"您输入的邀请码不正确，请重新输入。"}]}


# POST /api/v1/sms.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSJ9.aw62HjxpebDz9mIszd1zZ6nWuifeC0F0wVKOZSHIozc
            X-Request-Id: 9dbba576-0493-4158-8e3e-d826cd44f389
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "phone_number": "8618537100239",
                "_rucaptcha": "upmck"
            }



# GET /api/v1/accounts.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Transfer-Encoding: chunked
            Etag: W/"6939850e49e5a40f7ebc1380528ca73a"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 85189dcb-c39b-4e4b-a724-6ddd4ad284b3
            X-Runtime: 0.033663
            Cache-Control: max-age=0, private, must-revalidate

    + Body

            {"success":true,"data":[{"code":"ETH","name":"ETH","visible":false,"depositable":false,"withdrawable":false,"balance":"0.0","locked":"0.0","address":null},{"code":"USDT","name":"Tether","visible":false,"depositable":false,"withdrawable":false,"balance":"0.0","locked":"0.0","address":null}],"upgrade":{"school_version":"1.0.1","school_url":"https://assets.bitrabbit.com/upload/796fe015-67b4-4f16-95f5-8363ff395f70.dex"}}


# GET /api/v1/my.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Transfer-Encoding: chunked
            Etag: W/"a7512a4405d2e8ff49e1bbe3653d6fe8"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 76cc01c7-8dc6-4c15-96da-eaeff2d82b28
            X-Runtime: 0.126742
            Cache-Control: max-age=0, private, must-revalidate

    + Body

            {"success":true,"data":{"id":1,"nickname":"root","phone_number":"123123","invite_code":"VEXXFV","level":0,"id_document":{"name":null,"id_document_number":null,"state":"verified"}},"upgrade":{"school_version":"1.0.1","school_url":"https://assets.bitrabbit.com/upload/796fe015-67b4-4f16-95f5-8363ff395f70.dex"}}


# GET /api/v1/markets.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# GET /api/v1/notices.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# GET /api/v1/banners.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# GET /api/v1/transfers.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# POST /api/v1/transfers.json?phone_number=8613774417663&amount=1099999

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# GET /api/v1/products.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# GET /api/v1/orders.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {}



# POST /api/v1/orders.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "product_id": "1"
            }



# POST /api/v1/orders/8/done.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "product_id": "1"
            }



# GET /api/v1/activities.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "product_id": "1"
            }



# GET /my/id_documents

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "product_id": "1"
            }



# GET /api/v1/deposits.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "product_id": "1"
            }

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Frame-Options: SAMEORIGIN
            X-Runtime: 0.025178
            X-XSS-Protection: 1; mode=block
            Transfer-Encoding: chunked
            CF-Cache-Status: DYNAMIC
            Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
            Cache-Control: max-age=0, private, must-revalidate
            X-Request-Id: 0571d990-3383-49a4-8f52-a15e2ac5ab84
            CF-RAY: 572574079fc1aa1e-SIN
            X-Content-Type-Options: nosniff
            Etag: W/"13e418bfee93420b882e0894eeaef24d"
            Vary: Accept-Encoding

    + Body

            {"success":true,"data":[],"upgrade":{"school_version":"1.0.1","school_url":"https://assets.bitrabbit.com/upload/796fe015-67b4-4f16-95f5-8363ff395f70.dex"}}


# GET /api/v1/withdraws.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "product_id": "1"
            }



# POST /api/v1/withdraws.json

+ Request (application/json; charset=utf-8)

    + Headers

            X-App-Key: 4e87aca6fb9d18b1ac67
            locale: zh-CN
            X-App-Auth: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQwMjMxMzksImV4cCI6MTU4NDAyMzE5OSwic2lnIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnBZWFFpT2pFMU9EUXdNak14TXprc0ltVjRjQ0k2TVRVNE5EQXlNekU1T1gwLk1VOTY2VzZoVzRuWjUtSXZUOER4UkpSUG1JY1VwNm5kbGJHMUlDb2dRODQiLCJtZW1iZXJfaWQiOiIxIiwidGltZXN0YW1wIjoiMTU4NDAyMzEzOSIsIm1lbWJlcl90b2tlbiI6IjAxZmRiODIyMDJhMjU2ODA4MmRlM2RkOTFkYTg2ZjcwIn0.Rsdoc4taC7nhZ5ZWtYkrilLDNUDAjGUuRIzIUCXpH9k
            Cookie: _base_session=ajc4anNZYW9xMnk1TW5MQ05KZGxkeHkwc1EvN1MxVllmWWZyUnRnSjhXVjQ4cHJpQkI3Qlp0dkFVbG5DV0srRFVjMHdmYUMyRldmV2lvREU3aWVoeCs3VVZtbnR2aW5rekJYdW9BZFk5dGs1b0NJS3FQeTRKb1FrZFJ2RlFVZlJxbEZZUlpzM2ppQjRwZXllM1NZRVlnPT0tLXdVd3NHRTlWSVJHOCs0QTMyeUtFaEE9PQ%3D%3D--85e92ad024b9b842625bb33523317a5b74ff45d6

    + Body

            {
                "to": "0x70a72ad43bc5acca529bd2ef14fe8975c5e245ae",
                "amount": "1"
            }



