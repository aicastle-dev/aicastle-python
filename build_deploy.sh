# .env 파일의 내용을 읽어 환경 변수로 설정
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# 기존에 빌드된 파일 삭제
rm -rf build dist *.egg-info

# get_version.py를 사용하여 버전 정보 가져오기
VERSION=$(python get_version.py)

# Git 커밋 및 태그 추가
git add .
git commit -m "Release version $VERSION"
git tag -a "v$VERSION" -m "Version $VERSION"
git push origin --tags
git push origin

# 패키지 빌드
python setup.py sdist bdist_wheel

# twine을 사용하여 업로드
twine upload dist/*