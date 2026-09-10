<script lang="ts">
  import { onMount } from 'svelte';
  import IconToggle from '$lib/components/IconToggle.svelte';
  import Sun from '@lucide/svelte/icons/sun';
  import Moon from '@lucide/svelte/icons/moon';

  let { class: className }: { class?: string } = $props();

  let dark = $state(false);

  onMount(() => {
    dark = document.documentElement.classList.contains('dark');
  });

  function applyTheme(value: boolean) {
    document.documentElement.classList.toggle('dark', value);
    localStorage.setItem('theme', value ? 'dark' : 'light');
  }
</script>

<IconToggle
  bind:pressed={dark}
  onIcon={Sun}
  offIcon={Moon}
  label="Toggle theme"
  class={className}
  onToggle={applyTheme}
/>
