## 作用

- 所有资源模块化
- 正确的配置依赖

## 资源管理

- 加入适当的`loader`
- 让资源文件可以像导入`js`一样使用

## 输出管理

- `clean-webpack-plugin`依赖
  - 清理dist目录
- `html-webpack-plugin`依赖
  - 动态模板的index.html

## 开发设置

- `devtool: 'inline-source-map'`配置
- 打包文件和源文件的映射，可以跟踪到源文件的错误

- 自动编译
  - `webpack --watch`脚本
  - `webpack-dev-server`依赖
  - `express,webpack-dev-middleware`依赖

## 代码分离

- 防止重复的依赖导入 webpack.config.js

- 会将重复导入的依赖分离出来

  ```js
  optimization: {
      splitChunks: {
          chunks: 'all'
      }
  }
  ```

##   缓存

- 使生成的文件拥有固定的hash值

- 使node_modules分离出来

  ```j s
      optimization: {
          moduleIds: 'hashed',
          runtimeChunk: 'single',
          splitChunks: {
              cacheGroups: {
                  vendor: {
                      test: /[\\/]node_modules[\\/]/,
                      name: 'vendors',
                      chunks: 'all'
                  }
              }
          }
      }
  ```

  ## 

## 