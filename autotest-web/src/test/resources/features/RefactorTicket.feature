#language:ru
@lanit
Функционал: Редактирование тикета Helpdesk

  Сценарий: Создание нового тикета, его редактирование с прикреплением файла

    # Открывает Страницу Helpdesk
    * открыть url "https://at-sandbox.workbench.lanit.ru/"
    * инициализация страницы "Lanit"
    * на странице имеется элемент "New Ticket"
    * кликнуть на элемент "New Ticket"

    # Заполяет форму тикета и жмет на кнопку Submit Ticket
    * на странице имеется элемент "Queue"
    * ввести в поле "Queue" значение "Some Product"
    #--
    * на странице имеется элемент "Summary of the problem"
    * ввести в поле "Summary of the problem" значение "title"
    #--
    * на странице имеется элемент "Priority"
    * ввести в поле "Priority" значение "2"
    #--
    * на странице имеется элемент "Your E-Mail Address"
    * ввести в поле "Your E-Mail Address" значение "example@email.ru"
    #--
    * на странице имеется элемент "Submit Ticket"
    * кликнуть на элемент "Submit Ticket"

    # Жмет на кнопку Login, заполняет форму и авторизуется
    * на странице имеется элемент "Username"
    * ввести в поле "Username" значение "admin"
    #--
    * на странице имеется элемент "Password"
    * ввести в поле "Password" значение "adminat"
    #--
    * на странице имеется элемент "Login"
    * кликнуть на элемент "Login"

    # Заполняет форму Search... и жмет на кнопку поиска
    * на странице имеется элемент "Search..."
    * ввести в поле "Search..." значение "title"
    #--
    * на странице имеется элемент "Go"
    * кликнуть на элемент "Go"

    # Жмет на строку найденного тикета
    * на странице имеется элемент "title"
    * кликнуть на элемент "title"

    # Жмет на кнопку Edit(редактирования)
    * на странице имеется элемент "Edit"
    * кликнуть на элемент "Edit"

    # Заполняет форму тикета для редактирования и жмет кнопку Save Changes
    * на странице имеется элемент "Your E-Mail Address"
    * ввести в поле "Your E-Mail Address" значение "exampleChange@email.ru"
    #--
    * на странице имеется элемент "Save Changes"
    * кликнуть на элемент "Save Changes"

    # Прикрепляет файл
    * на странице имеется элемент "Attach File(s)"
    * кликнуть на элемент "Attach File(s)"
    #--
    * на странице имеется элемент "Browse..."
    * кликнуть на элемент "Browse..."
    #--
    * на странице имеется элемент "Update This Ticket"
    * кликнуть на элемент "Update This Ticket"