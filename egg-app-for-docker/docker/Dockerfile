FROM node:18

WORKDIR /app
# 坑：使用缓存，不会拿到最新代码
# ARG COMMIT_ID
# RUN git clone https://github.com/huoyuxin/sharing.git ./

# test cache
# RUN echo 'after this step, cache should not work, old cache is still there'
# WORKDIR /app/egg-app-for-docker
# WORKDIR (cd not work)
# RUN npm i

COPY . .

EXPOSE 7001
# CMD ["npm", "run", "dev"]