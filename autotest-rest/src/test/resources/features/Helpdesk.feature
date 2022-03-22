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

    # Создаем тикет
    * создать запрос
      | method | path         | body              |
      | POST   | /api/tickets | createTicket.json |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 201
    * извлечь данные
      | id              | $.id              |
      | queue           | $.queue           |
      | title           | $.title           |
      | description     | $.description     |
      | priority        | $.priority        |
      | submitter_email | $.submitter_email |
    * сравнить значения
      | ${id}              | != | null |
      | ${queue}           | != | null |
      | ${title}           | != | null |
      | ${description}     | != | null |
      | ${priority}        | != | null |
      | ${submitter_email} | != | null |

    # Входим на сайт
    * создать запрос
      | method | path         | body              |
      | POST   | /api/login   | createToken.json  |
    * добавить header
      | Content-Type    | application/json  |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | token           | $.token           |

    # Вторая часть теста - запрос id и проверка данных
    * создать запрос
      | method        | path             |
      | GET           | /api/tickets/${id}   |
    * добавить header
      | Accept        | application/json |
      | Content-Type  | application/json |
      | authorization | ${token}         |
      | username      | admin            |
      | password      | adminat          |

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
