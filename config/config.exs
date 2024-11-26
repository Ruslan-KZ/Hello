import Config

# Настройка репозитория Ecto
config :hello, Hello.Repo,
  # Укажите ваше имя пользователя для базы данных
  username: "arslan",
  # Укажите ваш пароль для базы данных
  password: "1234567890",
  # Укажите хост базы данных (можно использовать localhost для локальной базы)
  hostname: "192.168.0.2",
  # Название вашей базы данных
  database: "hello_dev",
  # Включаем вывод стека ошибок для удобства отладки
  stacktrace: true,
  # Показываем подробные ошибки при подключении, для отладки
  show_sensitive_data_on_connection_error: true,
  # Размер пула подключений к базе данных
  pool_size: 10

# Укажите Ecto репозитории
config :hello, ecto_repos: [Hello.Repo]
# Конфигурация для Phoenix Endpoint
config :hello, HelloWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hello.PubSub,
  live_view: [signing_salt: "secret_salt"]

# Конфигурация почтового адаптера
config :hello, Hello.Mailer, adapter: Swoosh.Adapters.Local

# Настройки для Swoosh API клиента
config :swoosh, :api_client, false

# Настройка для esbuild
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Логирование
config :logger,
  backends: [:console, {LoggerFileBackend, :error_log}]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  level: :debug

config :logger, :error_log,
  # Указываем путь для ошибок
  path: "error.log",
  # Логируем только ошибки
  level: :error,
  # Формат сообщений
  format: "$time $metadata[$level] $message\n",
  # Метаданные запроса
  metadata: [:request_id],
  # Не обрезаем длинные сообщения
  truncate: :infinity

# Используем Jason для JSON в Phoenix
config :phoenix, :json_library, Jason

# Импорт окруженческих конфигураций
import_config "#{config_env()}.exs"
