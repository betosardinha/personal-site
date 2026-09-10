<script lang="ts">
  import IconToggle from '$lib/components/IconToggle.svelte';
  import X from '@lucide/svelte/icons/x';
  import Menu from '@lucide/svelte/icons/menu';

  let { open = $bindable(false), class: className }: { open?: boolean; class?: string } = $props();
</script>

<IconToggle bind:pressed={open} onIcon={X} offIcon={Menu} label="Toggle menu" class={className} />
