import Config

# Configure the database connection
config :hello, Hello.Repo,
  username: "arslan",           # Укажите ваше имя пользователя для базы данных
  password: "1234567890",       # Укажите ваш пароль для базы данных
  hostname: "192.168.0.2",      # Укажите хост базы данных (можно использовать localhost для локальной базы)
  database: "hello_dev",         # Название вашей базы данных
  stacktrace: true,              # Включаем вывод стека ошибок для удобства отладки
  show_sensitive_data_on_connection_error: true, # Показываем подробные ошибки при подключении, для отладки
  pool_size: 10                 # Размер пула подключений к базе данных

# Configure Phoenix Endpoint (Web server)
config :hello, HelloWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],  # Устанавливаем локальный адрес и порт для сервера
  check_origin: false,                      # Отключаем проверку источников для запросов
  code_reloader: true,                      # Включаем перезагрузку кода при изменениях
  debug_errors: true,                      # Включаем подробные ошибки в браузере для отладки
  secret_key_base: "HJeXJGdLIl2Gsosd9OQc5HndNfOGikI48W437scpNjvxugX3wE2joPxuidsjBDo0", # Секретный ключ для сессий и cookies
  watchers: [
    # Настройка для использования esbuild для мониторинга изменений фронтенда
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

# Optional: SSL support for HTTPS in development (can be uncommented if needed)
# To use HTTPS locally, generate self-signed certificate using: mix phx.gen.cert
#
# config :hello, HelloWeb.Endpoint,
#   https: [
#     port: 4001,
#     cipher_suite: :strong,
#     keyfile: "priv/cert/selfsigned_key.pem",
#     certfile: "priv/cert/selfsigned.pem"
#   ],

# Live reload for static files and templates in development
config :hello, HelloWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",  # Отслеживаем изменения в статических файлах
      ~r"priv/gettext/.*(po)$",                           # Отслеживаем изменения в переводах
      ~r"lib/hello_web/(live|views)/.*(ex)$",              # Отслеживаем изменения в live- и view-модулях
      ~r"lib/hello_web/templates/.*(eex)$"                  # Отслеживаем изменения в шаблонах
    ]
  ]

# Console logging configuration in development
config :logger, :console, format: "[$level] $message\n"

# Increase the stacktrace depth for better error details during development
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime to speed up compilation in development
config :phoenix, :plug_init_mode, :runtime

# Mailer configuration
# Using local adapter for development, to store emails in the browser at "/dev/mailbox"
config :hello, Hello.Mailer, adapter: Swoosh.Adapters.Local

# Disable Swoosh API client for local usage
config :swoosh, :api_client, false

# esbuild configuration for bundling JavaScript and CSS
config :esbuild,
  version: "0.14.29", # Specify the version of esbuild
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__), # Path to your assets folder
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)} # Path for npm dependencies
  ]

# Logger configuration (for debugging)
config :logger, :console,
  format: "$time $metadata[$level] $message\n", # Default log format
  level: :debug # Set log level to debug for detailed logs
