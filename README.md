# CenterX 도커


- `docker-compose up` 이라고 명령하면 실행이 된다.
- `/home` 폴더에는 `/home/default` 폴더가 있는데, phpMyAdmin 이 여기에 설치되어져 있다.
  - 참고로 `/home` 폴더는 .gitignore 에 추가되어져 있어 home 폴더 아래에서 git clone 을 해도 된다.
- 실행 후 `https://127.0.0.1/etc/phpMyAdmin/index.php` 와 같이 phpMyAdmin 에 접속 할 수 있으며 적절한 도메인으로 변경하면 된다.
- 기본적으로 `centerx` 데이터베이스가 생성된다.
