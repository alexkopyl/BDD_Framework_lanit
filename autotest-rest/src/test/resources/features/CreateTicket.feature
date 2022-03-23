#language:ru
@api-test

Функционал: Тестирование сервиса Helpdesk
  - Создание тикета с высоким приоритетом POST запросом с телом из json файла, значения которого заполняем сгенерированным значениями
  - После создания нового тикета, GET запросом запрашиваем данного тикета и проверяем, что его данные соответствует данными из тела запроса

  Сценарий: Создание и проверка тикета

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
      | submitter_email  | EEEEEEEE@EEEDDD.EE |

    # Создаем тикет
    * создать запрос
      | method | path         | body                  |
      | POST   | /api/tickets | createTicketOpen.json |
    * добавить header
      | Content-Type    | application/json  |
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
