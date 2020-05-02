## docker-compose build --build-arg INPUT=test.png gdal2tiles
## docker-compose run gdal2tiles

FROM osgeo/gdal:ubuntu-small-latest

ARG INPUT="input.png"
ARG MEM_SIZE=1000000000

ENV EINPUT=$INPUT
ENV JPEGMEM=$MEM_SIZE
ENV GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=$MEM_SIZE

RUN mkdir -p /opt/imgs
ADD imgs/${INPUT} /opt/imgs
WORKDIR /opt/imgs

CMD ["sh", "-c", "gdal2tiles.py --profile=raster --resampling=lanczos --webviewer=none --tilesize=512 ${EINPUT} output/${EINPUT}"]
