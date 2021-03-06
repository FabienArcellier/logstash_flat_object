# the value of `params` is the value of the hash passed to `script_params`
# in the logstash configuration
def register(params)
    @field = params["field"]
end

# the filter method receives an event and must return a list of events.
# Dropping an event means not including it in the return array,
# while creating new ones only requires you to add a new instance of
# LogStash::Event to the returned array
def filter(event)
    context = event.get("context")
    if not context.is_a?(Hash)
      context = {}
    end

    context[@field] = event.get(@field)
    event.set("context", context)
    event.remove(@field)

    [event]
end