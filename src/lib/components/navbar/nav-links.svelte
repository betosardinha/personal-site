<script lang="ts">
  import * as NavigationMenu from '$lib/components/ui/navigation-menu/index.js';
  import NavLink from './nav-link.svelte';

  let {
    links,
    active,
    onSelect,
    class: className
  }: {
    links: { id: string; label: string }[];
    active: string;
    onSelect: (id: string) => () => void;
    class?: string;
  } = $props();
</script>

<NavigationMenu.List class={className}>
  {#each links as link (link.id)}
    <NavLink
      href={link.id}
      label={link.label}
      active={active === link.id}
      onSelect={onSelect(link.id)}
    />
  {/each}
</NavigationMenu.List>
