## docker-compose build
## docker-compose run gdal2tiles

FROM osgeo/gdal:ubuntu-small-latest

ARG MEM_SIZE=1000000000
ENV JPEGMEM=$MEM_SIZE
ENV GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=$MEM_SIZE

RUN mkdir -p /opt/imgs
ADD imgs/image_file.png /opt/imgs
WORKDIR /opt/imgs

RUN cp image_file.png _image_file.png && rm -rf image_file.png

CMD ["gdal2tiles.py", "--profile=raster", "--resampling=lanczos", "--webviewer=none", "_image_file.png"]
