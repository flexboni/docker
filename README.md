# CenterX 도커


- `docker-compose up` 이라고 명령하면 실행이 된다.
- `/home` 폴더에는 `/home/default` 폴더가 있는데, phpMyAdmin 이 여기에 설치되어져 있다.
  - 참고로 `/home` 폴더는 .gitignore 에 추가되어져 있어 home 폴더 아래에서 git clone 을 해도 된다.
- 실행 후 `https://127.0.0.1/etc/phpMyAdmin/index.php` 와 같이 phpMyAdmin 에 접속 할 수 있으며 적절한 도메인으로 변경하면 된다.
- 기본적으로 `centerx` 데이터베이스가 생성된다.



## MariaDB 백업

- 백업 스크립트 `backup.sh` 를 열어서, DB 접속 정보와 백업 저장할 폴더를 지정한다.
- 백업 스크립트 `backup.sh abc` 와 같이 실행하면, DB 를 백업해서 지정된 폴더에 abc.sql.gz 로 보관한다.
- 백업 스크립트를 아래와 같이 크론으로 등록한다.

```text
## 매일 새벽 1시에 백업. 1주일 단위로 백업 파일이 갱신된다. 즉, 1주일 전의 데이터는 날라간다.
00 1 * * 0 /docker/backup.sh sunday
00 1 * * 1 /docker/backup.sh monday
00 1 * * 2 /docker/backup.sh tuesday
00 1 * * 3 /docker/backup.sh wednesday
00 1 * * 4 /docker/backup.sh thursday
00 1 * * 5 /docker/backup.sh friday
00 1 * * 6 /docker/backup.sh saturday


## 월 2 회, 매월 1일, 16일 낮 12시에 백업을 한다. 즉, 한달에 2번, 1년에 24번 백업을 한다.
## jan.sql.gz 는 1일, jan16.sql.gz 는 16일.

00 12 1 1 * /docker/backup.sh jan
00 12 1 2 * /docker/backup.sh feb
00 12 1 3 * /docker/backup.sh mar
00 12 1 4 * /docker/backup.sh apr
00 12 1 5 * /docker/backup.sh may
00 12 1 6 * /docker/backup.sh jun
00 12 1 7 * /docker/backup.sh jul
00 12 1 8 * /docker/backup.sh aug
00 12 1 9 * /docker/backup.sh sep
00 12 1 10 * /docker/backup.sh oct
00 12 1 11 * /docker/backup.sh nov
00 12 1 12 * /docker/backup.sh dec

00 12 16 1 * /docker/backup.sh jan16
00 12 16 2 * /docker/backup.sh feb16
00 12 16 3 * /docker/backup.sh mar16
00 12 16 4 * /docker/backup.sh apr16
00 12 16 5 * /docker/backup.sh may16
00 12 16 6 * /docker/backup.sh jun16
00 12 16 7 * /docker/backup.sh jul16
00 12 16 8 * /docker/backup.sh aug16
00 12 16 9 * /docker/backup.sh sep16
00 12 16 10 * /docker/backup.sh oct16
00 12 16 11 * /docker/backup.sh nov16
00 12 16 12 * /docker/backup.sh dec16
```