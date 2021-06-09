FROM swift
WORKDIR /random
COPY . ./
#CMD swift package clean
ENTRYPOINT ["swift","run"]

#CMD swift run
#Ch