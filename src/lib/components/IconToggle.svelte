<script lang="ts">
  import { Button } from '$lib/components/ui/button/index.js';
  import type { Component } from 'svelte';

  interface Props {
    pressed?: boolean;
    onIcon: Component<{ size?: number }>;
    offIcon: Component<{ size?: number }>;
    label: string;
    class?: string;
    onToggle?: (pressed: boolean) => void;
  }

  let { pressed = $bindable(false), onIcon, offIcon, label, class: className, onToggle }: Props = $props();

  let Icon = $derived(pressed ? onIcon : offIcon);

  function toggle() {
    pressed = !pressed;
    onToggle?.(pressed);
  }
</script>

<Button variant="ghost" size="icon" class={className} onclick={toggle} aria-label={label}>
  <Icon size={18} />
</Button>
