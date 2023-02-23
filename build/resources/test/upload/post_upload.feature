@postUpload
Feature: Post upload of api testing

  Background:
    * url "http://localhost:5002/api/"
    * header Authorization = call read('../../util/basic-auth.js') { username: 'admin', password: 'admin' }
    * configure headers = { Accept : '*/*' , Content-Type : 'application/json'}
    * configure charset = null

