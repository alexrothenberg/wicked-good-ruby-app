WAIT_TIMEOUT = (ENV['WAIT_TIMEOUT'] || 30).to_f
STEP_PAUSE = (ENV['STEP_PAUSE'] || 0.5).to_f

# This is a cucumber method we mock out
def embed(file, mime_type, label)
  # no-op
end
