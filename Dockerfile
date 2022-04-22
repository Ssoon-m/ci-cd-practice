# 도커 이미지를 node 14.19.0 기반으로 만든다는 뜻
FROM node:14.19.0 
# app 라는 path를 만든다.
RUN mkdir -p /app
# 거기를 work directory 로 설정을 해준다. 
WORKDIR /app 
# 현재 있는 nuxt 프로젝트 파일들을 app밑으로 복사를 한다.
ADD . /app/

# yarn.lock 파일을 지운다. 파일이 없을 경우에 오류가 안나기 위해 true로 설정
RUN rm yarn.lock || true 
# package-lock.json 파일을 지운다.
RUN rm package-lock.json || true 
# yarn 을 실행 (npm install 과 같음)
RUN yarn 
# yarn build 로 프로젝트를 build 
RUN yarn build 

# 모든 ip를 open
ENV HOST 0.0.0.0 
# port를 3000번으로 개방해주는것
EXPOSE 3000 
# yarn start 로 프로젝트 실행
CMD ["yarn","start"] 