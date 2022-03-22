#language:ru
@api-test

Функционал: Тестирование сервиса Helpdesk
  - Создание тикета с высоким приоритетом POST запросом с телом из json файла, значения которого заполняем сгенерированным значениями
  - После создания нового тикета, GET запросом запрашиваем данного тикета и проверяем, что его данные соответствует данными из тела запроса

  Сценарий: Создание тикета


    # Первая часть теста - Создание тикета. Эти данные подставятся в тело запроса в шаблон тела файла createTicket.json
    # Генерится дандомная страка по маске
        # E - Английская буква,
        # R - русская буква,
        # D - цифра. Остальные символы игнорятся
        # Условна дана строка TEST_EEE_DDD_RRR - снегерится примерно такая - TEST_QRG_904_ЙЦУ
    * сгенерировать переменные
      | queue            | 1                  |
      | title            | EEEEEEEE           |
      | description      | EEEEEEEE           |
      | priority         | 2                  |
      | submitter_email  | EEEEEEEE@EEEDDD.EE |

    # Входим на сайт
    * создать запрос
      | method | path         | body              |
      | POST   | /api/login   | authToken.json |
    * добавить header
      | Content-Type | application/json |
      | username     | admin            |
      | password     | adminat          |
    * отправить запрос
    * статус код 201
    * извлечь данные
      | req_id              | $.id              |
      | req_queue           | $.queue           |
      | req_title           | $.title           |
      | req_description     | $.description     |
      | req_priority        | $.priority        |
      | req_submitter_email | $.submitter_email |
      | req_token           | $.token           |

    # Создаем тикет
    * создать запрос
      | method | path         | body              |
      | POST   | /api/tickets | createTicket.json |
    * добавить header
      | Content-Type | application/json |
      | username     | admin            |
      | password     | adminat          |
    * отправить запрос
    * статус код 201
    * извлечь данные
      | req_id              | $.id              |
      | req_queue           | $.queue           |
      | req_title           | $.title           |
      | req_description     | $.description     |
      | req_priority        | $.priority        |
      | req_submitter_email | $.submitter_email |
      | req_token           | $.token           |


    * сравнить значения
      | ${ticket_id}              | != | null |
      | ${ticket_queue}           | != | null |
      | ${ticket_title}           | != | null |
      | ${ticket_description}     | != | null |
      | ${ticket_priority}        | != | null |
      | ${ticket_submitter_email} | != | null |

    # Вторая часть теста - запрос id и проверка данных
    * создать запрос
      | method | path                      |
      | GET    | /api/tickets/req_id       |
    * добавить header
      | accept | application/json          |
      | token | application/json          |



    # Отправляем запрос
    * отправить запрос
    * статус код 200
    * извлечь данные
      | resp_queue             | $.queue           |
      | resp_title             | $.title           |
      | resp_description       | $.description     |
      | resp_priority          | $.priority        |
      | resp_submitter_email   | $.submitter_email |

    * сравнить значения
      | ${ticket_queue}             | == | ${resp_queue}             |
      | ${ticket_title}             | == | ${resp_title}             |
      | ${ticket_description}       | == | ${resp_description}       |
      | ${ticket_priority}          | == | ${resp_priority}          |
      | ${ticket_submitter_email}   | == | ${resp_submitter_email}   |
