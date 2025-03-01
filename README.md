**Rofi Background Selector**

개요

이 프로젝트는 rofi를 활용하여 배경화면을 선택하는 스크립트입니다. rofi_background_selector.sh를 실행하면 특정 폴더 내의 배경화면 목록을 표시하고, 사용자가 선택한 배경화면으로 변경할 수 있습니다.


실행 방법

필요한 패키지를 설치합니다.
```
sudo pacman -S rofi ffmpeg swww
```
또는 Debian 계열이라면:
```
sudo apt install rofi ffmpeg swww
```

실행 권한을 부여하고 실행합니다.
```
chmod +x rofi_background_selector.sh
./rofi_background_selector.sh <rofi config file path>
```
설정 및 커스터마이징

WALLPAPER_ROOT 및 CACHE_ROOT 변수를 수정하여 배경화면이 저장된 디렉터리를 변경할 수 있습니다.

Defualt
```
WALLPAPER_ROOT=~/.wallpapers
CACHE_ROOT=~/.wallpapers/cached_imgs
```
ffmpeg를 이용한 미리보기 이미지 생성 방식은 필요에 따라 조정할 수 있습니다.

rofiConfig.rasi 파일을 수정하여 UI 스타일을 변경할 수 있습니다.

의존성

rofi : 배경화면 선택 인터페이스 제공

ffmpeg : 배경화면 미리보기 이미지 생성

swww : 배경화면 전환 효과 적용

주의 사항

swww는 Wayland 환경에서만 동작합니다. X11을 사용하고 있다면 feh 또는 nitrogen과 같은 대체 툴을 사용할 수 있습니다.

ffmpeg가 설치되어 있어야 미리보기 이미지가 생성됩니다.
