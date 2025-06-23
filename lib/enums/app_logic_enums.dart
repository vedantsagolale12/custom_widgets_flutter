// ===== HTTP & API OPERATIONS =====

/// HTTP request methods
enum HttpMethod { 
  get, 
  post, 
  put, 
  patch, 
  delete, 
  head, 
  options, 
  connect, 
  trace 
}

/// HTTP status code categories
enum HttpStatusCategory { 
  informational, // 1xx
  success,       // 2xx
  redirection,   // 3xx
  clientError,   // 4xx
  serverError    // 5xx
}

/// Common HTTP status codes
enum HttpStatusCode { 
  // Success
  ok,                    // 200
  created,               // 201
  accepted,              // 202
  noContent,             // 204
  
  // Redirection
  movedPermanently,      // 301
  found,                 // 302
  notModified,           // 304
  
  // Client Errors
  badRequest,            // 400
  unauthorized,          // 401
  forbidden,             // 403
  notFound,              // 404
  methodNotAllowed,      // 405
  conflict,              // 409
  unprocessableEntity,   // 422
  tooManyRequests,       // 429
  
  // Server Errors
  internalServerError,   // 500
  notImplemented,        // 501
  badGateway,            // 502
  serviceUnavailable,    // 503
  gatewayTimeout,        // 504
}

/// API response formats
enum ResponseFormat { 
  json, 
  xml, 
  html, 
  text, 
  binary, 
  formData, 
  csv, 
  pdf 
}

/// Content types for requests
enum ContentType { 
  json, 
  formUrlEncoded, 
  multipartFormData, 
  textPlain, 
  textHtml, 
  applicationXml, 
  applicationPdf, 
  imagePng, 
  imageJpeg, 
  imageGif,
  applicationOctetStream
}

/// API authentication types
enum AuthenticationType { 
  none, 
  basic, 
  bearer, 
  apiKey, 
  oauth1, 
  oauth2, 
  jwt, 
  digest, 
  custom 
}

/// Request priority levels
enum RequestPriority { 
  low, 
  normal, 
  high, 
  critical, 
  background 
}

/// Cache strategies
enum CacheStrategy { 
  noCache, 
  cacheFirst, 
  networkFirst, 
  cacheOnly, 
  networkOnly, 
  staleWhileRevalidate 
}

// ===== API ENDPOINTS & ROUTING =====

/// API versions
enum ApiVersion { 
  v1, 
  v2, 
  v3, 
  beta, 
  alpha, 
  deprecated, 
  latest 
}

/// Route types
enum RouteType { 
  public, 
  protected, 
  admin, 
  system, 
  webhook, 
  internal 
}

/// API endpoint categories
enum EndpointCategory { 
  auth, 
  user, 
  admin, 
  content, 
  media, 
  payment, 
  notification, 
  analytics, 
  system, 
  integration,
  reporting,
  search
}

/// Request/Response patterns
enum ApiPattern { 
  restful, 
  graphql, 
  rpc, 
  soap, 
  websocket, 
  serverSentEvents, 
  grpc 
}

// ===== DATABASE OPERATIONS =====

/// Database operation types
enum DatabaseOperation { 
  create, 
  read, 
  update, 
  delete, 
  upsert, 
  bulk, 
  transaction, 
  migration, 
  backup, 
  restore 
}

/// Database query types
enum QueryType { 
  select, 
  insert, 
  update, 
  delete, 
  join, 
  union, 
  subquery, 
  aggregate, 
  indexScan, 
  fullTableScan 
}

/// Database index types
enum IndexType { 
  primary, 
  unique, 
  composite, 
  partial, 
  functional, 
  fullText, 
  spatial, 
  hash, 
  btree 
}

/// Database relationship types
enum RelationshipType { 
  oneToOne, 
  oneToMany, 
  manyToOne, 
  manyToMany, 
  selfReferencing 
}

/// Database constraint types
enum ConstraintType { 
  primaryKey, 
  foreignKey, 
  unique, 
  notNull, 
  check, 
  defaultType,
  exclusion 
}

/// Transaction isolation levels
enum IsolationLevel { 
  readUncommitted, 
  readCommitted, 
  repeatableRead, 
  serializable 
}

/// Database connection pool states
enum ConnectionPoolState { 
  initializing, 
  active, 
  idle, 
  closing, 
  closed, 
  error 
}

// ===== DATA TYPES & VALIDATION =====

/// Data types for validation
enum DataType { 
  string, 
  integer, 
  decimal, 
  boolean, 
  date, 
  datetime, 
  timestamp, 
  uuid, 
  email, 
  url, 
  phone, 
  json, 
  array, 
  object, 
  binary,
  enum_,
  text,
  longText
}

/// Validation rules
enum ValidationRule { 
  required, 
  optional, 
  nullable, 
  unique, 
  minLength, 
  maxLength, 
  pattern, 
  range, 
  email, 
  url, 
  phone, 
  alphanumeric, 
  numeric, 
  alpha, 
  custom 
}

/// Data format types
enum DataFormat { 
  camelCase, 
  snakeCase, 
  kebabCase, 
  pascalCase, 
  uppercase, 
  lowercase, 
  titleCase 
}

// ===== ERROR HANDLING =====

/// Error categories
enum ErrorCategory { 
  validation, 
  authentication, 
  authorization, 
  network, 
  database, 
  business, 
  system, 
  external, 
  timeout, 
  rateLimit 
}

/// Error severity levels
enum ErrorSeverity { 
  low, 
  medium, 
  high, 
  critical, 
  fatal 
}

/// Error handling strategies
enum ErrorHandlingStrategy { 
  throw_, 
  return_, 
  log, 
  retry, 
  fallback, 
  ignore, 
  escalate 
}

/// Retry strategies
enum RetryStrategy { 
  none, 
  immediate, 
  linear, 
  exponential, 
  custom 
}

// ===== LOGGING & MONITORING =====

/// Log levels
enum LogLevel { 
  trace, 
  debug, 
  info, 
  warn, 
  error, 
  fatal, 
  off 
}

/// Log categories
enum LogCategory { 
  application, 
  security, 
  performance, 
  database, 
  network, 
  business, 
  system, 
  audit, 
  debug 
}

/// Monitoring metrics
enum MetricType { 
  counter, 
  gauge, 
  histogram, 
  summary, 
  timer, 
  rate, 
  throughput 
}

/// Performance indicators
enum PerformanceIndicator { 
  responseTime, 
  throughput, 
  errorRate, 
  cpuUsage, 
  memoryUsage, 
  diskUsage, 
  networkLatency, 
  databaseQueryTime 
}

// ===== SECURITY =====

/// Security roles
enum SecurityRole { 
  guest, 
  user, 
  moderator, 
  admin, 
  superAdmin, 
  system, 
  service 
}

/// Permission types
enum PermissionType { 
  read, 
  write, 
  update, 
  delete, 
  execute, 
  admin, 
  owner, 
  custom 
}

/// Encryption algorithms
enum EncryptionAlgorithm { 
  aes128, 
  aes256, 
  rsa, 
  ecc, 
  blowfish, 
  des, 
  tripleDes 
}

/// Hash algorithms
enum HashAlgorithm { 
  md5, 
  sha1, 
  sha256, 
  sha512, 
  bcrypt, 
  scrypt, 
  argon2 
}

// ===== ENVIRONMENT & DEPLOYMENT =====

/// Environment types
enum Environment { 
  development, 
  testing, 
  staging, 
  production, 
  sandbox, 
  demo 
}

/// Deployment strategies
enum DeploymentStrategy { 
  blueGreen, 
  canary, 
  rollingUpdate, 
  recreate, 
  shadow, 
  ab 
}

/// Service status
enum ServiceStatus { 
  healthy, 
  degraded, 
  unhealthy, 
  unknown, 
  maintenance, 
  starting, 
  stopping 
}

// ===== MESSAGING & COMMUNICATION =====

/// Message types
enum MessageType { 
  command, 
  event, 
  query, 
  notification, 
  broadcast, 
  unicast, 
  multicast 
}

/// Message priority
enum MessagePriority { 
  low, 
  normal, 
  high, 
  urgent, 
  immediate 
}

/// Queue strategies
enum QueueStrategy { 
  fifo, 
  lifo, 
  priority, 
  delay, 
  retry, 
  deadLetter 
}

/// Notification channels
enum NotificationChannel { 
  email, 
  sms, 
  push, 
  webhook, 
  slack, 
  teams, 
  discord, 
  inApp 
}

// ===== FILE & STORAGE =====

/// Storage types
enum StorageType { 
  local, 
  cloud, 
  database, 
  memory, 
  cache, 
  cdn, 
  temporary 
}

/// File operations
enum FileOperation { 
  upload, 
  download, 
  delete, 
  move, 
  copy, 
  rename, 
  compress, 
  decompress 
}

/// File types
enum FileType { 
  image, 
  video, 
  audio, 
  document, 
  spreadsheet, 
  presentation, 
  archive, 
  executable, 
  text, 
  unknown 
}

/// Compression types
enum CompressionType { 
  none, 
  gzip, 
  deflate, 
  brotli, 
  lz4, 
  zstd 
}

// ===== INTEGRATION & EXTERNAL SERVICES =====

/// Integration types
enum IntegrationType { 
  webhook, 
  api, 
  database, 
  messageQueue, 
  fileSync, 
  realTime, 
  batch 
}

/// Third-party services
enum ThirdPartyService { 
  payment, 
  email, 
  sms, 
  analytics, 
  monitoring, 
  storage, 
  cdn, 
  search, 
  social, 
  maps 
}

/// Synchronization types
enum SyncType { 
  realTime, 
  nearRealTime, 
  batch, 
  scheduled, 
  manual, 
  eventDriven 
}

// ===== BUSINESS LOGIC =====

/// Business rule types
enum BusinessRuleType { 
  validation, 
  calculation, 
  workflow, 
  approval, 
  notification, 
  transformation 
}

/// Workflow states
enum WorkflowState { 
  pending, 
  inProgress, 
  completed, 
  cancelled, 
  failed, 
  suspended, 
  approved, 
  rejected 
}

/// Payment statuses
enum PaymentStatus { 
  pending, 
  processing, 
  completed, 
  failed, 
  cancelled, 
  refunded, 
  partiallyRefunded 
}

/// Order statuses
enum OrderStatus { 
  draft, 
  pending, 
  confirmed, 
  processing, 
  shipped, 
  delivered, 
  cancelled, 
  returned, 
  refunded 
}