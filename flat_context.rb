# the value of `params` is the value of the hash passed to `script_params`
# in the logstash configuration
def register(params)
end

# the filter method receives an event and must return a list of events.
# Dropping an event means not including it in the return array,
# while creating new ones only requires you to add a new instance of
# LogStash::Event to the returned array
def filter(event)
    context = event.get("context")
    context_flat = flat_hash(context, 'context')
    context_flat.each_pair do |key, val|
      event.set(key, val)
    end
    event.remove("context")

    [event]
end

def flat_hash(hash, prefix)
  new_hash = {}
  hash.each_pair do |key, val|
    if val.is_a?(Hash)
      next_prefix = prefix + '.' + key
      new_hash.merge!(flat_hash(val, next_prefix))
    else
      new_hash[prefix + '.' + key] = val
    end
  end

  new_hash
end