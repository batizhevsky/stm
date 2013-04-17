### Status
Develop:
  [![Build Status](https://travis-ci.org/leonko/stm.png?branch=develop)](https://travis-ci.org/leonko/stm)
  [![Coverage Status](https://coveralls.io/repos/leonko/stm/badge.png?branch=develop)](https://coveralls.io/r/leonko/stm)
Master
  [![Build Status](https://travis-ci.org/leonko/stm.png?branch=master)](https://travis-ci.org/leonko/stm)
  [![Coverage Status](https://coveralls.io/repos/leonko/stm/badge.png?branch=master)](https://coveralls.io/r/leonko/stm)

[simple-task-manager.herokuapp.com](http://simple-task-manager.herokuapp.com)

### api:
GET http://localhost:3000/api/stories.json?q[state_eq]=accepted&per=2&page=2
[filter sintax](https://github.com/ernie/ransack/wiki/Basic-Searching)

<pre><code>
{
    "page": 2,
    "per_page": 2,
    "num_pages": 2,
    "items":
    [
        {
            "id": 4,
            "body": "test body",
            "created_at": "2013-04-08T06:11:07Z",
            "state": "accepted",
            "owner":
            {
                "id": 12,
                "name": "test1",
                "state": "deleted"
            },
            "comments":
            [
                {
                    "id": 13,
                    "comment": "dfsdfsd dsfsdf dsfdsf dfdsf",
                    "created_at": "2013-04-11T08:49:23Z",
                    "creator":
                    {
                        "id": 11,
                        "name": "test",
                        "state": "active"
                    }
                }
            ]
        }
    ]
}
</code></pre>
