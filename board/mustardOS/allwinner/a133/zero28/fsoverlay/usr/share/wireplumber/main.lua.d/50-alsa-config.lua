alsa_monitor.enabled = true

alsa_monitor.properties = {
  ["alsa.reserve"] = false,
  ["alsa.midi"] = false,
  ["alsa.midi.monitoring"] = true,
  ["vm.node.defaults"] = {
    ["api.alsa.period-size"] = 256,
    ["api.alsa.headroom"] = 8192,
  },
}

alsa_monitor.rules = {
  {
    matches = {
      {
        { "device.name", "matches", "alsa_card.*" },
      },
    },
    apply_properties = {
      ["api.alsa.use-acp"] = false,
      ["api.alsa.use-ucm"] = false,
      ["api.alsa.soft-mixer"] = true,
      ["api.acp.auto-profile"] = false,
      ["api.acp.auto-port"] = false,
      ["api.alsa.period-size"] = 1024,
      ["api.alsa.periods"] = 4,
    },
  },
  {
    matches = {
      {
        { "node.name", "matches", "alsa_input.*" },
      },
      {
        { "node.name", "matches", "alsa_output.*" },
      },
    },
    apply_properties = {
      ["api.alsa.card.0.device"] = "audiocodec",
      ["api.alsa.soft-mixer"] = true,
      ["alsa.mixer.control"] = "digital volume",
      ["alsa.mixer.device"] = "audiocodec",
      ["alsa.mixer.invert-volume"] = true,
      ["api.alsa.period-size"] = 1024,
      ["api.alsa.periods"] = 4,
      ["api.alsa.headroom"] = 0,
      ["api.alsa.start-delay"] = 0,
      ["api.alsa.disable-mmap"] = true,
      ["api.alsa.disable-batch"] = true,
      ["audio.format"] = "S16LE",
      ["audio.rate"] = 48000,
      ["audio.channels"] = 2,
      ["audio.position"] = "FL,FR",
      ["session.suspend-timeout-seconds"] = 0,
      ["node.pause-on-idle"] = false,
      ["node.nick"] = "Built-in Audio",
      ["priority.driver"] = 100,
      ["priority.session"] = 100,
    },
  },
}
