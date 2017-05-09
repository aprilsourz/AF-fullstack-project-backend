
# To Do List API

An API built for a to do list app. It has authentication, allowing
the user to sign in, sign out, sign up, and change password
The API will allow for the creation of new list items, editing
existing list items, delete list items, and will get all the
list items for the associated user when they sign in.

## API end-points

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| GET    | `/items`               | `items#index`     |
| POST   | `/games`               | `games#create`    |
| GET    | `/games/:id`           | `games#show`      |
| PATCH  | `/games/:id`           | `games#update`    |
| GET    | `/games/:id/watch`     | `games#watch`     |

All data returned from API actions is formatted as JSON.

---

## User actions

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### signup

The `create` action expects a *POST* of `credentials` identifying a new user to
 create.

```
```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}
```

### signin

The `signin` action expects a *POST* with `credentials` identifying a previously
 registered user.

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the user's `id`, `email`, and the `token`
 used to authenticate other requests.
```json
{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "an example authentication token"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 401
 Unauthorized, and the response body will be empty.

### signout

The `signout` actions is a *DELETE* specifying the `id` of the user to sign out.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful, the response will have a status of 401
 Unauthorized.

### changepw

The `changepw` action expects a PATCH of `passwords` specifying the `old` and
 `new`.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful the reponse will have an HTTP status of 400 Bad
 Request.

---

The `sign-out` and `change-password` requests must include a valid HTTP header
 `Authorization: Token token=<token>` or they will be rejected with a status of
 401 Unauthorized.

## Item actions

All items action requests must include a valid HTTP header `Authorization: Token
 token=<token>


*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/items`</td>
<td><strong>item</strong></td>
<td>200, OK</td>
<td><strong>item w/ id</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/items/:id`</td>
<td><strong>item</strong></td>
<td>200 OK</td>
<td><strong>item w/ id</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>422 Unprocessable Entity</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/items/:id`</td>
<td>empty</td>
<td>204 no content</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>GET</td>
<td>`/items/</td>
<td><strong>item</strong></td>
<td>200 OK</td>
<td><strong>Items for signed in user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 bad request</td>
  <td><em>Items w/ ids</em></td>
</tr>
</table>

### index

The `index` action is a *GET* that retrieves all the items associated with a
 user.
The response body will contain JSON containing an array of games, e.g.:

```json
{
  "items": [
    {
      "content": "Item 1",
      "id": 43
    },
    {
      "content": "Item 2",
      "id": 3
    }
  ]
}
```
### create

The `create` action expects a *POST* 

Example JSON

```json
{
    "item": {
      "content": "Item Content"
    }
  }
 ```

If the request is successful, the response will have an HTTP Status of 200
 OK, and the body will contain JSON of the Item and its id.

```json
{
  "item": {
    "content": "Item Content",
    "id": 48
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.


### destroy

The `destroy` actions is a *DELETE* specifying the `id` of the list item to delete.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful, the response will have a status of 401
 Unauthorized.

### update

The `update` action is a *PATCH* specifying the `id` of the list item to edit.

Eample JSON

```json
{
    "item": {
      "content": "item content"
    }
  }
```

If the request is successful, the response will have an HTTP Status of 200
 OK, and the body will contain JSON of the Item and its id.

```json
{
  "item": {
    "content": "Item Content",
    "id": 48
  }
}
```
If the request is unsuccessful the reponse will have an HTTP status of 422 Unprocessable Entity
