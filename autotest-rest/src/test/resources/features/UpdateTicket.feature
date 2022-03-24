#language:ru
@api-test

Функционал: Тестирование сервиса Helpdesk
  - Создание тикета с высоким приоритетом и закрытым статусом POST запросом с телом из json файла, значения которого заполняем сгенерированным значениями
  - После создания нового тикета, GET запросом запрашиваем данного тикета и проверяем, что его данные соответствует данными из тела запроса
  - После проверки тикета на соответствие методом PUT пытаемся перевести статус с закрыт на открыт, негативно принимаем статус-код ошибки

  Сценарий: Создание и обновление тикета

    # Первая часть теста - Создание тикета. Эти данные подставятся в тело запроса в шаблон тела файла createTicket.json
    # Генерится рандомная строка по маске
        # E - Английская буква,
        # R - русская буква,
        # D - цифра. Остальные символы игнорятся
        # Условно дана строка TEST_EEE_DDD_RRR - сгенерится примерно такая - TEST_QRG_904_ЙЦУ
    * сгенерировать переменные
      | queue            | 1                  |
      | title            | EEEEEEEE           |
      | description      | EEEEEEEE           |
      | priority         | 2                  |
      | status           | 4                  |
      | submitter_email  | EEEEEEEE@EEEDDD.EE |

    # Создаем тикет
    * создать запрос
      | method | path         | body                   |
      | POST   | /api/tickets | createTicketClose.json |
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
      | status          | $.status          |
      | submitter_email | $.submitter_email |
    * сравнить значения
      | ${id}              | != | null |
      | ${queue}           | != | null |
      | ${title}           | != | null |
      | ${description}     | != | null |
      | ${priority}        | != | null |
      | ${status}          | != | null |
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
      | method        | path                 |
      | GET           | /api/tickets/${id}   |
    * добавить header
      | Accept        | application/json     |
      | Content-Type  | application/json     |
      | Authorization | token ${token}       |

    # Отправляем запрос
    * отправить запрос
    * статус код 200
    * извлечь данные
      | resp_queue              | $.queue           |
      | resp_title              | $.title           |
      | resp_description        | $.description     |
      | resp_priority           | $.priority        |
      | resp_submitter_email    | $.submitter_email |
    * сравнить значения
      | ${queue}           | == | ${resp_queue}           |
      | ${title}           | == | ${resp_title}           |
      | ${description}     | == | ${resp_description}     |
      | ${priority}        | == | ${resp_priority}        |
      | ${submitter_email} | == | ${resp_submitter_email} |

    #Обновляем статус тикета
    * создать запрос
      | method | path                 | body                   |
      | PUT    | /api/tickets/${id}   | createTicketClose.json  |
    * добавить header
      | Accept          | application/json  |
      | Content-Type    | application/json  |
      | Authorization   | token ${token}    |
    * отправить запрос
    * статус код 422