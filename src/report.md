# DO5_SimpleDocker
## Part 1:
1. docker pull nginx

    ![docker](screen/quest1.1.png)
    <br>

2.  docker images

    ![docker](screen/quest1.2.png)
    <br>

3. docker run -d nginx

    ![docker](screen/quest1.3.png)

    - -d (detach) - это флаг, который указывает Docker на запуск контейнера в фоновом режиме (detached mode). Это означает, что контейнер будет работать в фоновом режиме, и командная строка будет освобождена для дальнейшего использования.
    <br>

4. docker ps

    ![docker](screen/quest1.4.png)
    <br>

5. docker inspect

    ![docker](screen/quest1.5.png)
    <br>

6. По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера

    - Размер контейнера
    ![docker](screen/size-container.png)
    <br>

    - Список замапленых портов
    ![docker](screen/ports-lists.png)
    <br>

    - IP контейнера
    ![docker](screen/ip-container.png)
    <br>

7. Остановить докер образ через docker stop. Проверить, что образ остановился через docker ps

    ![docker](screen/quest1.7.png)
    <br>

8. Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run

    ![docker](screen/quest1.8.png)
    <br>

9. Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx

    ![docker](screen/quest1.9.png)
    <br>

## Part 2. Операции с контейнером

1. Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec

    ![docker](screen/quest2.1.png)
    <br>

2. Создать на локальной машине файл nginx.conf. Настроить в нем по пути /status отдачу страницы статуса сервера nginx

    ![docker](screen/quest2.2.png)
    <br>

3. Скопировать созданный файл nginx.conf внутрь докер образа через команду docker cp
    
    ![docker](screen/quest2.3.png)
    <br>

4. Перезапустить nginx внутри докер образа через команду exec
    
    ![docker](screen/quest2.4.png)
    <br>

5. Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

    ![docker](screen/quest2.5.png)
    <br>

6. Экспортировать контейнер в файл container.tar через команду export. Остановить контейнер

    ![docker](screen/quest2.6.png)
    <br>

7. Удалить образ через docker rmi не удаляя перед этим контейнеры

    ![docker](screen/quest2.7.png)
    <br>

8. Удалить остановленный контейнер

    ![docker](screen/quest2.8.png)
    <br>

9. Импортировать контейнер обратно через команду import. Запустить импортированный контейнер

    ![docker](screen/quest2.9.png)
    <br>

10. Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

    ![docker](screen/quest2.10.png)
    <br>


## Part 3. Мини веб-сервер

1. Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!
    ![docker](screen/quest3.1.png)
    <br>

2. Написать свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080
    ![docker](screen/quest3.2.png)
    <br>

3. Запуск:

    - Теперь выкачаем новый docker-образ и на его основе запустим новый контейнер
    ![docker](screen/quest3.run-port.png)

    - После перекинем конфиг и логику сервера в новый контейнер
    ![docker](screen/quest3-cp.png)

    - Затем установим требуемые утилиты для запуска мини веб-сервера на FastCGI, в частности spawn-fcgi и libfcgi-dev
    ![docker](screen/quest3.install.png)

    - компилируем и запустим наш мини веб-сервер через команду spawn-fcgi на порту 8080
    ![docker](screen/quest3.start.png)

    - проверим:
    ![docker](screen/quest3.final.png)
    <br>

## Part 4. Свой докер

### Написать свой докер образ, который:
1. собирает исходники мини сервера на FastCgi из Части 3
2. запускает его на 8080 порту
3. копирует внутрь образа написанный ./nginx/nginx.conf
4. запускает nginx.

![doker](screen/quest4.build.png)
<br>

![doker](screen/quest4.images.png)
<br>

- Проверяем
![docker](screen/quest4.finish.png)


## Part 5. Dockle
### Просканировать образ из предыдущего задания через dockle 
### Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений

- скачиваем Dockle
![docker](screen/quest5.dockle.png)

- Создаем скрипт для создания сервера и его проверки
![docker](screen/quest5.check.png)

- запускаем скрипт:
![docker](screen/quest5.final.png)


## Part 6. Базовый Docker Compose
### Написать файл docker-compose.yml, с помощью которого:
1. Поднять докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину)

2. Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера

- Проверим, что все контейнеры выключены и запустим сборку через команду docker-compose build
![docker](screen/quest6.compose.png)

- Поднимаем контейнер командой docker-compose up и проверяем сервер:
![docker](screen/quest6.final.png)
