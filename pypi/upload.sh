PROFILE="testpypi"

python setup.py checkdocs
python setup.py sdist bdist_wheel --universal
twine upload --repository $PROFILE dist/*
rm -rf dist build *.egg_info

