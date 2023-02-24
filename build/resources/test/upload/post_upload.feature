@postUpload
Feature: Post upload of api testing

  Background:
    * url "http://localhost:5002/api/"
    * header Authorization = call read('../util/basic-auth.js') { username: 'admin', password: 'admin' }
    * configure headers = { Accept : '*/*' , Content-Type : 'multipart/form-data'}
    * configure charset = null
    * def wait = function(pause){ java.lang.Thread.sleep(pause * 1000) }

    @uploadPng
    Scenario: Upload a file png successful
      Given path 'upload'
      * multipart file file = { read: '../util/images/imagen1.png' }
      When method Post
      Then status 201
      And match $ == {"success":true,"message":"File uploaded successfully!","url":"http://localhost:5002/fileuploads/imagen1.png"}

    @uploadJpeg
    Scenario: Upload a file jpeg successful
      Given path 'upload'
      * multipart file file = { read: '../util/images/imagen1.png', filename: 'imagen2.jpeg' }
      When method Post
      Then status 201
      And match $ == {"success":true,"message":"File uploaded successfully!","url":"http://localhost:5002/fileuploads/imagen2.jpeg"}