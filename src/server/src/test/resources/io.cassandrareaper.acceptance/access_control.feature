Feature: Access Control

  Scenario Outline: Request to protected resource is redirected to login page when accessed without login
    Given that we are going to use "127.0.0.1@test" as cluster seed host
    When a <path> <request> is made
    Then the response was redirected to the login page
    Examples:
      | path   | request              |
      | GET    | /webui               |
      | GET    | /webui/index.html    |

  Scenario Outline: Request to public resource is allowed without login
    Given that we are going to use "127.0.0.1@test" as cluster seed host
    When a <path> <request> is made
    Then a "OK" response is returned
    Examples:
      | path   | request              |
      | GET    | /cluster             |
      | GET    | /repair_run          |
      | GET    | /repair_schedule     |
